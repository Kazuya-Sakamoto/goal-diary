require "date"

d1 = Date.today
d2 = Date.new(2019,12,01)

# goal.day =

print("本日の日付:", d1, "\n")
print("3日後の日付:", d1 + 3, "\n")
print("2ヶ月後の日付:", d1 >> 2, "\n")
print("6ヶ月前の日付:", d1 >> 6, "\n")
print("本日の日付と#{d2}との差は",  "#{d2-d1},日です\n")