package LetterCount;

import java.util.*;

public class Helper {

    public static LinkedHashMap<String, Integer> countWords(String str) {
        LinkedHashMap<String, Integer> wordMap = new LinkedHashMap<>();
        // split white space
        String[] words = str.split("\\s+");
        for (String word : words) {
            // Count word occurrence
            if (word.matches(".*[a-zA-z].*")){
                wordMap.put(word, wordMap.getOrDefault(word, 0) + 1);
            }
            
        }
        return wordMap;
        
        
    }
    

    public static HashMap<Character, Integer> countCharacters(String str) {
        HashMap<Character, Integer> charMap = new HashMap<>();
        // remove space characters
        String characters = str.replaceAll("\\s+", "");
        for (char c : characters.toCharArray()) {
            // count character occurrence
            if (Character.isLetter(c)) {
                charMap.put(c, charMap.getOrDefault(c, 0) + 1);
            }
        }
        return charMap;
    }

    public static void printMap(Map<?, Integer> map) {
        System.out.print("{");
        for (Map.Entry<?, Integer> entry : map.entrySet()) {
            System.out.print(entry.getKey() + "=" + entry.getValue() + ", ");
        }
        System.out.print("\b\b");
        System.out.println("}");
    }
    

}
