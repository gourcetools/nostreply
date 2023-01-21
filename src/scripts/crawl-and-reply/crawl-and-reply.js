const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
    // Read the contents of ../../../config/ASK-MESSAGE
    const text = fs.readFileSync("../../../config/ASK-MESSAGE", "utf-8");

    // Replace spaces with "+"
    const textWithPlus = text.replace(/ /g, "+");

    // Replace "TEXT" in the URL with the contents of ../../../config/ASK-MESSAGE
    const url = 'https://nostr.band/?q=TEXT'.replace("TEXT", textWithPlus);

    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto(url);

    // Wait for the page to fully load
    await page.waitForSelector('small.text-muted.event-id');

    // Extract the value from the "<small class="text-muted event-id">" tags
    const value = await page.$eval('small.text-muted.event-id', el => el.innerHTML);

    console.log(`${value}`);

    await browser.close();
})();
