import pyspark.sql.functions as F
from pyspark.sql.types import StringType
from pyspark.sql import SparkSession

class GradeStat:

    def __init__(self, well_count, less_well_count, not_good_count):
        self.well_count = well_count
        self.less_well_count = less_well_count
        self.not_good_count = not_good_count

def func(score): 
    if score > 90:
        return 'well'
    elif 80 < score <= 90:
        return 'less well'
    else: 
        return 'not well'

def student_grade_stat(data_file: str) -> GradeStat:
    import pyspark.sql.functions as F
    from pyspark.sql.types import StringType
    from pyspark.sql import SparkSession
    spark = SparkSession.builder.enableHiveSupport().getOrCreate()
    df = spark.read.csv(data_file, encoding='utf-8', header=True, inferSchema=True)
    udfsomefunc = F.udf(func, StringType())
    df_with_grade = df.withColumn("grade", udfsomefunc("score"))
    df_with_grade_group = df_with_grade.groupby('grade').count()
    grade = list(i[0] for i in df_with_grade_group.select("grade").collect())
    count = list(i[0] for i in df_with_grade_group.select("count").collect())
    res = dict(zip(grade, count))
    return GradeStat(res['well'], res['less well'], res['not well'])
