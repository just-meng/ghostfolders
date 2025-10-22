import random

drugs = ['Ketamine', 'Lisuride', 'LSD']
user_input = input('Enter the subject IDs separated by space: ')
subjects = user_input.split(' ')
file = open('../../04_methods/02_code/drug_randomization/randomized_drug_assignment.txt', 'a')
for sub in subjects:
    random.shuffle(drugs)
    file.write(f'{sub}: {", ".join(drugs)} \n')
file.close()


