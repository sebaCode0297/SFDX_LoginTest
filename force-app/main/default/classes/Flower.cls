public with sharing class Flower {

    public static Integer Wilt(Integer numberOfPetals){
        if (numberOfPetals >= 1) {
            numberOfPetals--;
        }
        return numberOfPetals;
    }

    public static void grow(Integer height, Integer maxHeight){
        height = height + 2;
        if (height >= maxHeight) {
            pollinate();
        }

    }

    public static void pollinate(){
        System.debug('Pollinating...');
    }

    Flower Rosa = new Flower();
}