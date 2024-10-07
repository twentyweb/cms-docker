const puppeteer = require("puppeteer");

(async () => {
    console.log("Launching browser...");

    // Launch Puppeteer
    const browser = await puppeteer.launch({
        headless: true,
        protocolTimeout: 10000,
        args: [
            "--no-sandbox",
            "--disable-gpu",
            "--disable-setuid-sandbox",
            "--disable-dev-shm-usage",
        ],
    });

    console.log("New page...");

    // Create a new page
    const page = await browser.newPage();

    console.log("Visiting url...");

    // Navigate to a website
    await page.goto("https://nodejs.org/en");

    console.log("Closing browser...");

    // Close Puppeteer
    await browser.close();

    console.log("Puppeteer executed successfully inside Docker container!");
})();
