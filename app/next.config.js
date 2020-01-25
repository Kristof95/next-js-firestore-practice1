require('dotenv').config({ path: '.env' });
module.exports = (phase, { defaultConfig }) => {
  return {
    env: {
      API_KEY: process.env.API_KEY,
      DATABASE_URL: process.env.DATABASE_URL,
      AUTH_DOMAIN: process.env.AUTH_DOMAIN,
      STORAGE_BUCKET: process.env.STORAGE_BUCKET,
      PROJECT_ID: process.env.PROJECT_ID
    },
    webpack: config => {
      // Fixes npm packages that depend on `fs` module
      config.node = {
        fs: 'empty',
      };
      return config;
    },
  };
};