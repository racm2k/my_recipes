
const express = require('express');
const recipes = require('./mocks/recipes');
const cors = require('cors');
const WebSocket = require('ws');
const app = express();
const PORT = 8080;

const wss = new WebSocket.Server({ port: 8081 });

var version = 1;

wss.on('connection', (ws) =>{
    console.log('Client connected');
    ws.send(version);
    ws.on('message', (message) => {
        console.log(`Received message => ${message}`);

    });
});

var recipesList = recipes.recipes;

app.use(express.json());
app.use(cors());

app.listen(PORT, () => {
    console.log(`Server is alive on http://127.0.0.1:${PORT}`);
    console.log('Press Ctrl+C to quit.');
});

app.get('/recipes-list', (req, res) => {
    res.json(recipes);
});

app.post('/recipe/add', (req, res) => {
    const newRecipe = req.body;
    recipesList.push(newRecipe);
    wss.clients.forEach((client) => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(++version);
        }
    });
    res.json(newRecipe);
});

app.get('/recipe/:id', (req, res) => {
    const id = parseInt(req.params.id);
    const recipe = recipesList.find((recipe) => recipe.id == id);
    if (recipe) {
        res.json(recipe);
    } else {
        res.status(404).send(`Recipe with id ${id} not found`);
    }
});

app.patch('/recipe/:id', (req, res) => {
    const recipeId = parseInt(req.params.id);
    const { name, ingredients, instructions } = req.body;

    const recipeToUpdate = recipesList.find(recipe => recipe.id == recipeId);

    if (!recipeToUpdate) {
        return res.status(404).json({ error: 'Recipe not found' });
    }

    if (name) {
        recipeToUpdate.name = name;
    }
    if (ingredients) {
        recipeToUpdate.ingredients = ingredients;
    }
    if (instructions) {
        recipeToUpdate.instructions = instructions;
    }

    res.json(recipeToUpdate);
});

app.delete('/recipe/:id', (req, res) => {
    const id = parseInt(req.params.id);
    const recipeIndex = recipesList.findIndex((recipe) => recipe.id == id);
    if (recipeIndex !== -1) {
        recipesList.splice(recipeIndex, 1);
        res.send(`Recipe with id ${id} deleted`);
    } else {
        res.send(`Recipe with id ${id} not found`);
    }
});

app.patch('/recipe/:id/like', (req, res) => {
    const id = parseInt(req.params.id);
    const recipeIndex = recipesList.findIndex((recipe) => recipe.id == id);
    if (recipeIndex !== -1) {
        recipesList[recipeIndex].likes += 1;
        res.send(`Recipe with id ${id} updated`);
    }else{
        res.send(`Recipe with id ${id} not found`);
    }
});

app.patch('/recipe/:id/dislike', (req, res) => {
    const id = parseInt(req.params.id);
    const recipeIndex = recipesList.findIndex((recipe) => recipe.id == id);
    if (recipeIndex !== -1) {
        recipesList[recipeIndex].likes -= 1;
        res.send(`Recipe with id ${id} updated`);
    }
    else {
        res.send(`Recipe with id ${id} not found`);
    }
});
