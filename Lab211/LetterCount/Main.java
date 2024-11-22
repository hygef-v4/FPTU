package LetterCount;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter your content: ");
        String str = scanner.nextLine();

        LinkedHashMap<String, Integer> wordMap = Helper.countWords(str);
        HashMap<Character, Integer> charMap = Helper.countCharacters(str);

        System.out.println(wordMap);
        System.out.println(charMap);

    }
}
