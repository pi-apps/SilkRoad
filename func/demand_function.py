import numpy as np


# Define the demand function
def demand_function(price):
    return max(0, 100 - 0.5 * price)


# Define the reward function
def reward_function(price, demand):
    return price * demand


# Define the reinforcement learning agent
class PricingAgent:

    def __init__(self, min_price, max_price, learning_rate, discount_factor):
        self.min_price = min_price
        self.max_price = max_price
        self.learning_rate = learning_rate
        self.discount_factor = discount_factor
        self.price_history = []
        self.reward_history = []

    def choose_action(self, state):
        price, demand, reward = state
        action = (np.random.uniform(-1, 1) if np.random.rand() < 0.1 else
                  (price - self.min_price) / (self.max_price - self.min_price))
        return np.clip(action, -1, 1)

    def update_q_value(self, state, action, new_state, reward, done):
        q_value = reward
        if not done:
            new_price, new_demand, new_reward = new_state
            target_q_value = new_reward + self.discount_factor * max(
                [self.q_table[(new_price, demand)] for demand in range(101)])
            q_value = reward + self.discount_factor * target_q_value
        self.q_table[(price,
                      demand)] = (1 - self.learning_rate) * self.q_table[
                          (price, demand)] + self.learning_rate * q_value

    def train(self, env, num_episodes):
        self.q_table = {
            (price, demand): 0
            for price in range(self.min_price, self.max_price + 1)
            for demand in range(101)
        }
        for episode in range(num_episodes):
            state, done = env.reset(), False
            while not done:
                action = self.choose_action(state)
                new_state, reward, done, _ = env.step(action)
                self.update_q_value(state, action, new_state, reward, done)
                state = new_state
                self.price_history.append(state[0])
                self.reward_history.append(reward)


# Train the reinforcement learning agent
min_price = 50
max_price = 200
learning_rate = 0.1
discount_factor = 0.95
num_episodes = 1000

env = PricingEnvironment(min_price, min_price, max_price, demand_function,
                         reward_function)
agent = PricingAgent(min_price, max_price, learning_rate, discount_factor)
agent.train(env, num_episodes)


# Test the reinforcement learning agent
def test_agent(env, agent, num_episodes):
    for episode in range(num_episodes):
        state, done = env.reset(), False
        while not done:
            action = agent.choose_action(state)
            new_state, reward, done, _ = env.step(action)
            state = new_state
            print(
                f"Price: {round(state[0])}, Demand: {round(state[1])}, Reward: {reward}"
            )


test_agent(env, agent, 10)
