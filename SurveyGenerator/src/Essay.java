import java.io.Serializable;
import java.util.*;

public class Essay extends Question implements Serializable {

    protected String length;

    private static final long serialVersionUID = 1L;

    public String type = "Essay";

    public Essay() {
        this.self = "Essay";
    }

    //method to make essay questions
    public void make() {

        Scanner keyboard = new Scanner(System.in);

        //get the prompt
        System.out.println("Enter the prompt for your essay question:");
        this.prompt = keyboard.nextLine();

        int x = 0;

        while (x == 0) {
            //get the answer length
            System.out.println("Enter the essay length:");
            this.length = keyboard.nextLine();
            System.out.println("");

            try {
                //ensure valid input
                int len = Integer.parseInt(this.length);
                setLength(this.length);
                x++;
            }

            catch(Exception e) {
                System.out.println("Invalid number");
                System.out.println("Enter an integer\n");
            }
        }
    }

    //length getter and setter
    public void setLength(String l) {
        this.length = l;
    }

    public String getLength() {
        return this.length;
    }


    //method to print the question
    public void display() {

        System.out.println(getPrompt());
        System.out.println("Length: " + getLength() + " words");
    }



    //method to edit the question
    public void modify() {
        //ask to edit prompt
        modifyPrompt();
        Scanner keyboard = new Scanner(System.in);

        int x = 0;

        while (x == 0) {
            //ask to edit length
            System.out.println("Would you like to modify the answer length (yes or no)");
            String that = keyboard.nextLine();

            //if yes
            if (that.toLowerCase().equals("yes")) {
                int y = 0;

                while (y == 0) {
                    //ask for new length
                    System.out.println("Enter the new length:");
                    this.length = keyboard.nextLine();
                    System.out.println("");

                    try {
                        //ensure valid input
                        int len = Integer.parseInt(this.length);
                        setLength(this.length);
                        y++;
                        x++;
                    }

                    catch(Exception e) {
                        //invalid input
                        System.out.println("Invalid number");
                        System.out.println("Enter an integer\n");
                    }
                }
            }
            //if no nothing happens
            else if (that.toLowerCase().equals("no")) {
                x++;
            }
            else {
                //invalid input
                System.out.println("Not a valid answer.");
                System.out.println("Enter either yes or no");
            }
        }

    }

    //method to take this question
    public CorrectAnswerResponse take() {
        //display question
        this.display();

        Scanner keyboard = new Scanner(System.in);
        CorrectAnswerResponse answer = new CorrectAnswerResponse();
        String input;
        int maxLength = Integer.parseInt(this.length);

        int x = 0;

        //to ensure valid input
        while (x == 0) {
            //get input
            input = keyboard.nextLine();
            //split input into words
            String[] wordList = input.split("\\s+");

            //get length of user input
            int userLength = wordList.length;

            //if the number of words is less than the given length
            if (maxLength > userLength) {
                //set answer
                answer.setAnswer(input);
                x++;
            }
            //else ask for new input
            else {
                System.out.println("Answer is too long");
                System.out.println("Maximum input length is " + this.length + "words");
            }
        }

        return answer;

    }
}
