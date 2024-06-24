import 'package:flutter/material.dart';
import 'package:davidtip/results.dart';


class Input extends StatefulWidget {
  const Input({super.key});
 

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
   var billController = TextEditingController();
  var tipController = TextEditingController();
  var personsController = TextEditingController(); 
  final formKey = GlobalKey<FormState>();


  dynamic total (int bill, double tip){
        return (bill + (bill * tip/100));
    }

  dynamic share(int bill, int persons){
    return(bill/persons);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculator'),),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the bill',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                controller: billController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the tip percentage',
                  prefixIcon: Icon(Icons.money),
                ),
                keyboardType: TextInputType.number,
                controller: tipController,
                


              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the no. of people',
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.number,
                controller: personsController,
              
              ),
            ),

            ElevatedButton(onPressed: (){
              int bill = int.parse(billController.text);
              double tip = double.parse(tipController.text);
              int perperson = int.parse(personsController.text);

            var totalbill =  total(bill, tip);
            var shares = share(bill, perperson);


              

              Navigator.push(context, MaterialPageRoute(builder: (_)=> Results(bill: totalbill, perperson: shares)));

            }, child: const Text('Calculate'))

          ],
        ),)

    );

    
  }

  
    


}