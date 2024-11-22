import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class MyString implements IString {
    
    @Override
    public int f1(String input) {
        
        String[] words = input.split("\\s+");
        int count = 0;

        // Pattern to find even digits
        Pattern evenDigitPattern = Pattern.compile("[02468]");

        // Loop through each word
        for (String word : words) {
            Matcher matcher = evenDigitPattern.matcher(word);
            if (matcher.find()) {
                count++;
            }
        }

        return count;
    }

    @Override
    public String f2(String str) {
        // Split the input string into words
        String[] words = str.split("\\s+");
        
        for (int i = 0; i < words.length; i++) {
            if (isPalindrome(words[i])) {
                words[i] = "YY";
                break;
            }
        }

        return String.join(" ", words);
    }

   
    private boolean isPalindrome(String word) {
        int left = 0;
        int right = word.length() - 1;
        while (left < right) {
            if (word.charAt(left) != word.charAt(right)) {
                return false;
            }
            left++;
            right--;
        }
        return true;
    }
}
