import firebase from "firebase/app";
import 'firebase/auth';
import 'firebase/firestore';

const firebaseConfig = {
    apiKey: process.env.API_KEY,
    authDomain: process.env.AUTH_DOMAIN,
    databaseURL: process.env.DATABASE_URL,
    storageBucket: process.env.STORAGE_BUCKET,
    projectId: process.env.PROJECT_ID
};

export function initializeDatabase() {
  if (!firebase.apps.length) {
      firebase.initializeApp(firebaseConfig);
  }
  return firebase;
};