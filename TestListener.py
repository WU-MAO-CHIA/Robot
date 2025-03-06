from robot.libraries.BuiltIn import BuiltIn

class TestListener:
    ROBOT_LISTENER_API_VERSION = 2
    
    def start_suite(self, name, attrs):
        BuiltIn().log_to_console(f"開始測試套件: {name}")

    def end_suite(self, name, attrs):
        BuiltIn().log_to_console(f"結束測試套件: {name}, 狀態: {attrs['status']}")


    def start_test(self, name, attrs):
        BuiltIn().log_to_console(f"開始測試案例:{name}")
    
    def end_test(self, name, attrs):
        BuiltIn().log_to_console(f"結束測試案例:{name}, 狀態:{attrs['status']}")