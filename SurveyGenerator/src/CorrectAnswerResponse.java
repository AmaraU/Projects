import java.io.Serializable;
import java.util.*;

public class CorrectAnswerResponse implements Serializable {

    private static final long serialVersionUID = 1L;

    protected String name = "";

    //private ArrayList<ArrayList<CorrectAnswerResponse>> response = new ArrayList<ArrayList<CorrectAnswerResponse>>();

    protected ArrayList<String> answers = new ArrayList<String>();

    protected ArrayList<CorrectAnswerResponse> ansList = new ArrayList<CorrectAnswerResponse>();

    protected ArrayList<ArrayList<String>> taken = new ArrayList<ArrayList<String>>();


    public CorrectAnswerResponse() {}

    /**public CorrectAnswerResponse(ArrayList<ArrayList<CorrectAnswerResponse>> theAnswers) {
        response = theAnswers;
    }*/

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return name;
    }

    //function to display the answers
    public void display() {
        if (this.answers.size() == 0) {
            //if no answers
            System.out.println("There are no answers for this");
        }
        else {
            //iterate through list and print
            for (String ans : answers) {
                System.out.println(ans);
            }
        }
    }

    public ArrayList<String> getAnswer() {
        return this.answers;
    }

    public ArrayList<CorrectAnswerResponse> getAnswers() {
        return this.ansList;
    }

    public void setAnswer(String ans) {
        this.answers.add(ans);
    }

    /**public void setAnswer(ArrayList<CorrectAnswerResponse> list) {
        this.response.add(list);
    }*/

    public void setAnswer(CorrectAnswerResponse ans) {
        this.ansList.add(ans);
    }

}
