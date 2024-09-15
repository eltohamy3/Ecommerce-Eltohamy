



String HandelOrderType( int ordertype){

  return ordertype==1? "Delivery": "Recive"; 
}
String HandelPaymentMethod( int paymentMethod){

  return paymentMethod==1? "Chach ON Delivary": "Payment Cards"; 
}
String HandelOrdersState( int orderState){

  return orderState==4? "Archive": orderState==3? "On The Way": orderState==2?  "Ready To Picked Up by Delivery man": orderState==1?"The Order is being Prepared" :"Await Approval"; 

        //   0 wait 
        // 1 prepare 
        // 2 delivery Man
        // 3 on the way
        // 4 archived // done 

}

