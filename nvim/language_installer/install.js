#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const languages = process.argv.slice(2);

let coc_config = {}

// Install language
for (let language of languages) {
        const installer = path.join(__dirname, `installer/${language}/install.sh`);
        if (fs.existsSync(installer)) { 
            execSync(installer);
        }
        
        const language_server_config = path.join(__dirname, `installer/${language}/coc.json`);
        if (fs.existsSync(language_server_config)){
                const language_config = require(language_server_config);
                coc_config = {...coc_config, ...language_config};
        }
}

fs.writeFileSync('/root/.config/nvim/coc-settings.json', JSON.stringify(coc_config));
