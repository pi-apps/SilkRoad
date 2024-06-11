// gamification.js
import { Gamification } from 'gamification-sdk';

class GamificationManager {
    constructor(userId) {
        this.userId = userId;
        this.gamification = new Gamification();

        this.gamification.on('achievement_unlocked', (achievement) => {
            console.log(`User ${this.userId} unlocked achievement ${achievement.name}`);
        });
    }

    async unlockAchievement(achievementId) {
        await this.gamification.unlockAchievement(this.userId, achievementId);
    }

    async getLeaderboard() {
        return this.gamification.getLeaderboard(this.userId);
    }
}
