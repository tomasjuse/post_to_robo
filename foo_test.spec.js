const { test, expect } = require('@playwright/test');

async function handleCookieBanner(page) {
  const isVisible = await page.isVisible('#cookie-policy-panel', { timeout: 5000 }).catch(() => false);
  if (isVisible) {
    await page.click('text=Accept');
  }
}

test('Test Number Input', async ({ page }) => {
  await page.goto('https://practice.expandtesting.com/inputs');

  await handleCookieBanner(page);

  const today = new Date().toISOString().slice(0, 10);

  await page.fill('#input-number', '99');
  await page.fill('#input-text', 'hojaa');
  await page.fill('#input-password', 'Password123');
  await page.evaluate((date) => {
    document.getElementById('input-date').value = date;
  }, today);

  await page.click('#btn-display-inputs');

  await page.waitForSelector('#output-number', { timeout: 5000 });

  await expect(page.locator('#output-number')).toHaveText('99');
  await expect(page.locator('#output-number')).not.toHaveText('100');
  await expect(page.locator('#output-text')).toHaveText('hojaa');
  await expect(page.locator('#output-password')).toHaveText('Password123');
  await expect(page.locator('#output-date')).toHaveText(today);

  await page.screenshot({ path: 'playwright-screenshot.png' });
});
