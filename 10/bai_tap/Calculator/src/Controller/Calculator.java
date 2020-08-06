package Controller;

public class Calculator {
    public static float calculator( float first_operand, float second_operand, char operator){
        switch (operator){
            case '+':
                return  first_operand + second_operand;
            case '-':
                return first_operand - second_operand;
            case '*':
                return first_operand * second_operand;
            case '/':
                if (second_operand != 0){
                    return first_operand / second_operand;
                } else throw new RuntimeException("Can Div by zero");

            default: throw  new RuntimeException("Invalid  operation");

        }
    }
}
