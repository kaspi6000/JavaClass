package com.test.question;

import java.util.ArrayList;
import java.util.Arrays;

public class Test1 {
    public static void main(String[] args) {
        /** 원본 데이터 */
        int[] data = {10,3,4,50,4,4,1,2,10,10,25,2,10};
        
        /** 원본 데이터 유형 */
        ArrayList<Integer> itemList = new ArrayList<Integer>();
        /** 원본 데이터 유형별 중복개수 */
        ArrayList<Integer> cntList = new ArrayList<Integer>();
        
        //1. 데이터 유형 및 개수를 설정한다.
        for(int index = 0 ; index < data.length ; index++){
            //item이 등록되었는지 확인한다.
            //1.1 등록되지 않았을 때 처리
            if(!itemList.contains(data[index])){
                
                //1.1.1 item을 itemList에 추가한다.
                itemList.add(data[index]);
                
                //1.1.2 item이 몇개 들어있는지 세어서 cntList에 추가한다.
                int cnt = 0;
                for(int searchIndex = index; searchIndex < data.length; searchIndex++){
                    if(data[index] == data[searchIndex]){
                        cnt++;
                    }
                }
                cntList.add(cnt);
                for (int i = 0; i < cntList.size(); i++) {
                	System.out.println(cnt + " : " + cntList.get(i));
				}
                
                
                //1.1.3 cnt를 비교하여 itemList와 cntList를 높은순으로 정렬한다.
                for(int sourceIndex = 0 ; sourceIndex < cntList.size()-1 ; sourceIndex++){
                    for(int targetIndex = sourceIndex+1 ; targetIndex < cntList.size() ; targetIndex++){
                        if(cntList.get(sourceIndex) < cntList.get(targetIndex)){
                            int moveItem = 0;
                            
                            //cntList 위치 변경
                            moveItem = cntList.get(targetIndex);
                            cntList.set(targetIndex, cntList.get(sourceIndex));
                            cntList.set(sourceIndex, moveItem);
                            
                            //itemList 위치 변경
                            moveItem = itemList.get(targetIndex);
                            itemList.set(targetIndex, itemList.get(sourceIndex));
                            itemList.set(sourceIndex, moveItem);
                            
                        }
                    }
                }
                
            //1.2 등록되어 있을 경우 처리
            }else{
                continue;
            }            
            
        }//end 데이터 유형 및 개수를 설정
        
        //2. 데이터 유형별로 중복개수만큼 출력한다.
        for (int index = 0; index < cntList.size(); index++) {
            for (int i = 0; i < cntList.get(index); i++) {
                System.out.print(itemList.get(index));
                if(index != cntList.size()-1){
                    System.out.print(", ");
                }
            } 
        }
        
    }
}