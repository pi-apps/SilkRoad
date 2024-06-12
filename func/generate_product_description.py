import random
import re
import string

import torch
import transformers

# Load the pre-trained NLP model
nlp = transformers.BertForMaskedLM.from_pretrained("bert-base-uncased")


# Define a function to generate product descriptions
def generate_product_description(product_name, num_sentences=3):
    # Tokenize the product name
    input_ids = transformers.BertTokenizer.encode(product_name,
                                                  return_tensors="pt")

    # Generate masked tokens for the product name
    masked_input_ids = input_ids.clone()
    masked_input_ids[0][0] = transformers.BertTokenizer.convert_tokens_to_ids(
        "[MASK]")

    # Generate the product description
    output = nlp(masked_input_ids)[0]

    # Select the top k most likely words for each masked token
    top_k = 10
    probs = output.top_k(top_k)

    # Replace the masked tokens with the top k most likely words
    product_description = []
    for i in range(num_sentences):
        sentence = []
        for j in range(len(product_name)):
            token = transformers.BertTokenizer.convert_ids_to_tokens(
                masked_input_ids[0][j].item())
            sentence.append(
                transformers.BertTokenizer.decode(
                    probs[0][j][:, i].argmax().item()))
        product_description.append(" ".join(sentence))

    # Randomly select one of the generated sentences as the product description
    product_description = random.choice(product_description)

    # Add some random punctuation to the product description
    punctuation = random.choice(string.punctuation)
    product_description += punctuation
    product_description = re.sub(r"\[MASK\]",
                                 random.choice(string.ascii_lowercase),
                                 product_description)

    return product_description


# Test the generate_product_description function
product_name = "Smartphone"
print(generate_product_description(product_name))
