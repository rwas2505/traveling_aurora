vba_input = ARGV

element1 = vba_input[0]
element2 = vba_input[1]

final = "#{element1} #{element2}"


file = File.open("C:/Users/rwaszak/Desktop/Dev/aurora_grab/shell_test.txt", "w"){
  |file| file.puts final} 


