const Environment = require('../../.env.json');
// const FirebaseAppIDFile = require('../../ios/firebase_app_id_file.json');
const { sendScriptErrorMessageOnXCode, setInfoPListObj } = require('./helper');
const { exec } = require('child_process');
const AppMode = {
  development: 1,
  test: 2,
  uat: 3,
  production: 4,
};
let bundleId = '';
let versionCode = 1;
let versionName = '';
let appName = Environment.applicationName;
let googleServicesInfoPListName = "";
let firebaseAppIDFile = "";
let firebaseOptionsFile = "";

if (Environment.environmentMode === AppMode.development) {
  bundleId = Environment.bundleId.development.ios;
  versionCode = Environment.versionCode.development.ios;
  versionName = Environment.versionName.development.ios;
  appName += '-DEV';
  googleServicesInfoPListName = Environment.googleApi.servicesFileNames.ios.development;
  firebaseAppIDFile = Environment.googleApi.servicesFileNames.firebaseAppIdFile.development;
  firebaseOptionsFile = Environment.googleApi.servicesFileNames.firebaseOptions.development;
} else if (Environment.environmentMode === AppMode.test) {
  bundleId = Environment.bundleId.test.ios;
  versionCode = Environment.versionCode.test.ios;
  versionName = Environment.versionName.test.ios;
  appName += '-TEST';
  googleServicesInfoPListName = Environment.googleApi.servicesFileNames.ios.test;
  firebaseAppIDFile = Environment.googleApi.servicesFileNames.firebaseAppIdFile.test;
  firebaseOptionsFile = Environment.googleApi.servicesFileNames.firebaseOptions.test;
} else if (Environment.environmentMode === AppMode.uat) {
  bundleId = Environment.bundleId.uat.ios;
  versionCode = Environment.versionCode.uat.ios;
  versionName = Environment.versionName.uat.ios;
  appName += '-UAT';
  googleServicesInfoPListName = Environment.googleApi.servicesFileNames.ios.uat;
  firebaseAppIDFile = Environment.googleApi.servicesFileNames.firebaseAppIdFile.uat;
  firebaseOptionsFile = Environment.googleApi.servicesFileNames.firebaseOptions.uat;
} else if (Environment.environmentMode === AppMode.production) {
  bundleId = Environment.bundleId.production.ios;
  versionCode = Environment.versionCode.production.ios;
  versionName = Environment.versionName.production.ios;
  googleServicesInfoPListName = Environment.googleApi.servicesFileNames.ios.production;
  firebaseAppIDFile = Environment.googleApi.servicesFileNames.firebaseAppIdFile.production;
  firebaseOptionsFile = Environment.googleApi.servicesFileNames.firebaseOptions.production;
} else {
  sendScriptErrorMessageOnXCode('Please set your environment app mode in .env.json');
}

// Change Version Name in xCode config
const setVersionName = `sed -i '' -e 's/MARKETING_VERSION \\= [^\\;]*\\;/MARKETING_VERSION = ${versionName};/' Runner.xcodeproj/project.pbxproj`;
// Change Build Number in xCode config
const setVersionCode = `sed -i '' -e 's/CURRENT_PROJECT_VERSION \\= [^\\;]*\\;/CURRENT_PROJECT_VERSION = ${versionCode};/' Runner.xcodeproj/project.pbxproj`;
// Change bundleId in xCode config
const setBundleId = `sed -i '' -e 's/PRODUCT_BUNDLE_IDENTIFIER \\= [^\\;]*\\;/PRODUCT_BUNDLE_IDENTIFIER = ${bundleId};/' Runner.xcodeproj/project.pbxproj`;

exec(setBundleId, (error) => {
  if (error) {
    sendScriptErrorMessageOnXCode(error);
    return;
  }
  console.log(`Current Bundle ID: ${bundleId}`);
});

exec(setVersionName, (error) => {
  if (error) {
    sendScriptErrorMessageOnXCode(error)
    return;
  }
  console.log(`Current Version Name: ${versionName}`);
});

exec(setVersionCode, (error) => {
  if (error) {
    sendScriptErrorMessageOnXCode(error)
    return;
  }
  console.log(`Current Build Number: ${versionCode}`);
});

const createFirebaseAppIDFile = `cp ${firebaseAppIDFile} firebase_app_id_file.json`;
exec(createFirebaseAppIDFile, (error) => { sendScriptErrorMessageOnXCode(error) });

const createFirebaseOptionsFile = `cp ../lib/${firebaseOptionsFile} ../lib/firebase_options.dart`;
exec(createFirebaseOptionsFile, (error) => { sendScriptErrorMessageOnXCode(error) });

const createGoogleServicesInfo = `cp ${googleServicesInfoPListName} GoogleService-Info.plist`;
exec(createGoogleServicesInfo, (error) => { sendScriptErrorMessageOnXCode(error) });

console.log(`App Name: ${appName}`);
setInfoPListObj('CFBundleShortVersionString', versionName);
setInfoPListObj('CFBundleVersion', versionCode);
setInfoPListObj('CFBundleDisplayName', appName);
setInfoPListObj('CFBundleIdentifier', bundleId);

