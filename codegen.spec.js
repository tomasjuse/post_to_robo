import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://practice.expandtesting.com/inputs');
  await page.getByRole('spinbutton', { name: 'Input: Number' }).click();
  await page.getByRole('spinbutton', { name: 'Input: Number' }).fill('88');
  await page.getByRole('textbox', { name: 'Input: Text' }).click();
  await page.getByRole('textbox', { name: 'Input: Text' }).fill('hepp');
  await page.getByText('Input: Number Input: Text').click();
  await page.getByRole('textbox', { name: 'Input: Password' }).click();
  await page.getByRole('textbox', { name: 'Input: Password' }).fill('pass');
  await page.getByRole('textbox', { name: 'Input: Date' }).fill('2025-11-26');
  await page.getByRole('button', { name: 'Display Inputs' }).click();

  // following added after codegen to verify input
  await page.waitForTimeout(3000);
  await expect(page.getByText('pass', { exact: true })).toBeVisible();
  await expect(page.getByText('88')).toBeVisible();
  await expect(page.getByText('hepp')).toBeVisible();
  await expect(page.getByText('2025-11-26')).toBeVisible();
  await page.screenshot({ path: 'playwright-screenshot.png' });

});