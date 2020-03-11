module.exports = {
  name: 'angular-testing-library',
  preset: '../../jest.config.js',
  coverageDirectory: '../../coverage/libs/angular-testing-library',
  snapshotSerializers: [
    'jest-preset-angular/build/AngularNoNgAttributesSnapshotSerializer.js',
    'jest-preset-angular/build/AngularSnapshotSerializer.js',
    'jest-preset-angular/build/HTMLCommentSerializer.js'
  ]
};
