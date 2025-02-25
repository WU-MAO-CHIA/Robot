from robot.api import ExecutionResult

result = ExecutionResult('output.xml')
stats = result.statistics
print(f"Total Cases: {stats.total.total}")
print(f"Pass: {stats.total.passed}")
print(f"Fail: {stats.total.failed}")