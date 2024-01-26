import openai
openai.api_key = 'MY_API_KEY'

def generate_image(prompt):
    response = openai.Image.create(
        model="dall-e-3",  
        prompt=prompt,
        n=1  # Number of images to generate
    )
    
    generated_image_url = response['data'][0]['url']
    return generated_image_url

while True:
    user_input = input("Enter a prompt for DALL-E image generation: ")
    image_url = generate_image(user_input)
    print("Generated image URL:", image_url)
