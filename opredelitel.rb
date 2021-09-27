def Input_Matrix()
    matrix = Array.new
    puts "Inpuy number of row in matrix"
    n = gets.to_i
    puts "Input number of columne in matrix"
    k = gets.to_i
    if n != k
        puts "Input non quadro matrix, try again"
        puts "\n"
        matrix = Input_Matrix()
    else
        i = 0
        while i < n
            puts "Input #{i+1} row"
            row = readline.split.map(&:to_f)
            if row.length() != k
                puts "Wrong input row, try again"
                next
            end
            matrix << row
            i +=1
        end
    end
    matrix
end

def Determinante(matrix)
    result = 0
    if matrix.length == 2
        result += (matrix[0][0] * matrix[1][1]) - (matrix[0][1] * matrix[1][0])
        result
    else
        (0..matrix.length()-1).each do |j|# разложение матрицы по 1 строке
            matrix_j = generate_small_matrix(matrix, j)#создаем квадратичную матрицу поменьше, в которой отсутвсуют элементы 1 строки и j столбца
            if j % 2 == 0# узнаем с каким знаком нужно брать произведение на матрицу
                result += matrix[0][j] *  Determinante(matrix_j)
            else
                result -= matrix[0][j] *  Determinante(matrix_j)
            end
        end
    end
    result
end

def generate_small_matrix(matrix, k)#функция гененерирущая матрциу, в которой отсутвсуют элементы 1 строки и k столбца 
    matrix_small = Array.new()
    (1..matrix.length()-1).each do |i|#все строки кроме первой
        row = Array.new()
        (0..matrix.length()-1).each do |j|#все стобцы
            if j != k# если у нас не k столбец, то закидываем элемент в матрицу
                row << matrix[i][j]
            end
        end
        matrix_small << row#закидываем созданную строку в новую матрцу
    end
    matrix_small
end

b = Input_Matrix()
a = Determinante(b)
puts a
