// tutorials.js
import { Tutorial } from 'tutorial-sdk';

class TutorialManager {
    constructor(userId) {
        this.userId = userId;
        this.tutorial = new Tutorial();

        this.tutorial.on('tutorial_completed', (tutorial) => {
            console.log(`User ${this.userId} completed tutorial ${tutorial.name}`);
        });
    }

    async getTutorials() {
        return this.tutorial.getTutorials(this.userId);
    }

    async completeTutorial(tutorialId) {
        await this.tutorial.completeTutorial(this.userId, tutorialId);
    }
}
