import { ARFaceTracker } from 'aframe';
import { THREE } from 'three';

// Create an AR face tracker
const faceTracker = new ARFaceTracker({
  mode: 'face',
});

// Load the 3D try-on model
const tryOnModel = await loadModel('try-on.glb');

// Create an AR node for the try-on model
const tryOnNode = new ARNode({
  geometry: tryOnModel.geometry,
  material: tryOnModel.material,
  scale: { x: 0.1, y: 0.1, z: 0.1 },
});

// Add the try-on node to the scene
faceTracker.add(tryOnNode);

// Set up the AR experience
faceTracker.addEventListener('face-detected', () => {
  // Show the try-on node when the face is detected
  tryOnNode.visible = true;
});

faceTracker.addEventListener('face-lost', () => {
  // Hide the try-on node when the face is lost
  tryOnNode.visible = false;
});
