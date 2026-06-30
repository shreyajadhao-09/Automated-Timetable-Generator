from ortools.sat.python import cp_model

# Define available days, time slots, subjects, teachers, and rooms
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
time_slots = ["9:00 - 10:00 AM", "10:00 - 11:00 AM", "11:00 - 12:00 PM"]
subjects = ["Java", "Python", "PHP", "C++", "C"]
teachers = ["Prof. P.A. Chorey", "Prof. H.D. Misalkar", "Prof. U.V. Nikam", 
            "Dr. P.P. Deshmukh", "Dr. A.A. Gulhane"]
rooms = ["Room 101", "Room 102", "Room 103", "Room 104", "Room 105"]

# CSP Model
model = cp_model.CpModel()

# Decision variables
schedule = {}
for day in days:
    for slot in time_slots:
        for subject in subjects:
            schedule[(day, slot, subject)] = model.NewBoolVar(f"{day}_{slot}_{subject}")

# Constraints
# 1. Each subject should be assigned exactly once per day
for day in days:
    for subject in subjects:
        model.Add(sum(schedule[(day, slot, subject)] for slot in time_slots) <= 1)

# 2. Each time slot should have exactly one subject
for day in days:
    for slot in time_slots:
        model.Add(sum(schedule[(day, slot, subject)] for subject in subjects) <= 1)

# Solve CSP
solver = cp_model.CpSolver()
status = solver.Solve(model)

# Print timetable
if status == cp_model.FEASIBLE or status == cp_model.OPTIMAL:
    print("\nGenerated Timetable:\n")
    print("{:<10} {:<15} {:<10} {:<10}".format("Day", "Time Slot", "Subject", "Teacher"))
    print("-" * 50)
    for day in days:
        for slot in time_slots:
            for i, subject in enumerate(subjects):
                if solver.Value(schedule[(day, slot, subject)]) == 1:
                    print(f"{day:<10} {slot:<15} {subject:<10} {teachers[i]}")
else:
    print("No feasible timetable found!")
