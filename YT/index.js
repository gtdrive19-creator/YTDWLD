const express = require('express');
const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/download', (req, res) => {
    const videoUrl = req.query.url;
    if (!videoUrl) return res.status(400).send('Missing URL');

    // Filename template for yt-dlp
    const filename = `temp_${Date.now()}.mp3`;
    const outputPath = path.join(__dirname, filename);

    // yt-dlp command to extract audio as mp3
    const command = `yt-dlp -x --audio-format mp3 -o "${outputPath}" "${videoUrl}"`;

    exec(command, (error) => {
        if (error) {
            console.error(error);
            return res.status(500).send('Download failed');
        }

        // Send the file and delete it after
        res.download(outputPath, 'audio.mp3', (err) => {
            fs.unlinkSync(outputPath); 
        });
    });
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));