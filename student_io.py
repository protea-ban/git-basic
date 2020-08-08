import pandas as pd

def convert_file_format(input_file_path, output_file_path):
    df = pd.read_csv(input_file_path)
    df.to_json(output_file_path, orient='records')


if __name__ == "__main__":
    input_file_path = 'student.csv'
    output_file_path = 'student.json'
    convert_file_format(input_file_path, output_file_path)
