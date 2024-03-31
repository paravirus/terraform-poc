const express = require('express');
const axios = require('axios');
const app = express();
const port = 3000;

// Middleware to parse JSON and urlencoded request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from the public directory
app.use(express.static('public'));

// Define route to fetch module code
app.get('/module', async (req, res) => {
    try {
        const cloudProvider = req.query.cloudProvider;
        const resourceType = req.query.resourceType;
        const moduleCode = await fetchModuleCode(cloudProvider, resourceType);
        res.send(moduleCode);
    } catch (error) {
        console.error('Error fetching module code:', error);
        res.status(500).send('Error fetching module code.');
    }
});

// Function to fetch module code based on cloud provider and resource type
const fetchModuleCode = async (cloudProvider, resourceType) => {
    try {
        const response = await axios.get(`https://raw.githubusercontent.com/paravirus/terraform-poc/main/terraform_modules/${cloudProvider}/${resourceType}/${resourceType}.tf`);
        if (!response.data) {
            throw new Error('Module code not found.');
        }
        return response.data;
    } catch (error) {
        throw new Error('Error fetching module code.');
    }
};

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
