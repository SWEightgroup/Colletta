import java.util.ArrayList;
import java.io.*;
import java.util.Scanner;

public class comparator{
    public static void main(String args[])throws FileNotFoundException {
        Scanner s = new Scanner(new File(args[0]));
        ArrayList<String> list = new ArrayList<String>();
        while (s.hasNext()){
            list.add(s.next().toUpperCase());
        }
        s.close();
        Scanner s2 = new Scanner(new File(args[1]));
        ArrayList<String> list2 = new ArrayList<String>();
        while (s2.hasNext()){
            list2.add(s2.next().toUpperCase());
        }
        s2.close();
        
        for(String a:list) {
            if(!list2.contains(a))
                System.out.println(a);
        }
    }
}