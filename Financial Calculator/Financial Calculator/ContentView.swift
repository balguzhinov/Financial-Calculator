import SwiftUI

struct ContentView: View {
    
    @State private var Percentage = 2
    
    
    //Это основной доход в месяц
    @State var incomeSalary = ""
    @State var incomeExtra1 = ""
    @State var TotalPerMonth = ""
    
    //Обязательные затраты в месяц
    @State var Rent = ""
    @State var CommunalServices = ""
    @State var Transport = ""
    @State var Loan = ""
    @State var Food = ""
    
    
    //Проценты накопления
    let Percentages = [0,5,10,15,25]
    
    //Типа класса
    var totalPerPerson: Int {
        let Selection = Int(Percentages[Percentage]) //Процент накопления
        let moneyIncome1 = Int(incomeSalary) ?? 0 //Сумма дохода
        let moneyIncome2 = Int(incomeExtra1) ?? 0 //Сумма дополнительного дохода
        let moneySpend2 = Int(Rent) ?? 0
        let moneySpend3 = Int(CommunalServices) ?? 0
        let moneySpend4 = Int(Transport) ?? 0
        let moneySpend5 = Int(Loan) ?? 0
        let moneySpend6 = Int(Food) ?? 0
        let moneySpend = moneySpend2 + moneySpend3 + moneySpend4 + moneySpend5 + moneySpend6
        let moneyAmount = moneyIncome1 + moneyIncome2 //Общая сумма доходов
        let percentageValue = moneyAmount/100 * Selection //Процент откладывания
        let money = moneyAmount - moneySpend //Общая сумма денег без учета накопления
        let amountMoneyPerMonth = money - percentageValue //Доступная сумма денег в месяц
        
        
        return amountMoneyPerMonth
        }
    var totalPerYear: Int{
        let Selection = Int(Percentages[Percentage]) //Процент накопления
        let moneyIncome1 = Int(incomeSalary) ?? 0 //Сумма дохода
        let moneyIncome2 = Int(incomeExtra1) ?? 0 //Сумма дополнительного дохода
        let moneySpend2 = Int(Rent) ?? 0
        let moneySpend3 = Int(CommunalServices) ?? 0
        let moneySpend4 = Int(Transport) ?? 0
        let moneySpend5 = Int(Loan) ?? 0
        let moneySpend6 = Int(Food) ?? 0
        let moneySpend = moneySpend2 + moneySpend3 + moneySpend4 + moneySpend5 + moneySpend6
        let moneyAmount = moneyIncome1 + moneyIncome2 //Общая сумма доходов
        let percentageValue = moneyAmount/100 * Selection //Процент откладывания
        let money = moneyAmount - moneySpend //Общая сумма денег без учета накопления
        let accumulation = percentageValue * 12
        
        return accumulation
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section (header: Text("Доход в месяц: ")){
                    TextField("Зарплата", text: $incomeSalary)
                        .keyboardType(.decimalPad)
                    
                    TextField("Дополнительный доход", text: $incomeExtra1)
                        .keyboardType(.decimalPad)
                    
                }
                Section (header: Text("Обязательные затраты: ")){
                    TextField("Аренда квартиры", text: $Rent)
                        .keyboardType(.decimalPad)
                    
                    TextField("Коммунальные услуги", text: $CommunalServices)
                        .keyboardType(.decimalPad)
                    
                    TextField("Транспорт", text: $Transport)
                        .keyboardType(.decimalPad)
                    
                    TextField("Кредиты", text: $Loan)
                        .keyboardType(.decimalPad)
                    
                    TextField("Питание", text: $Food)
                        .keyboardType(.decimalPad)
                
                Section (header: Text("Какой процент откладываем?")){
                    
                    Picker("Процент ", selection: $Percentage) {
                        ForEach(0 ..< Percentages.count) {
                            Text("\(self.Percentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    
                    
                
                Section (header: Text("Доступно в месяц: ")){
                    Text("₸\(totalPerPerson)")
                }

                    Section (header: Text("Накопим за год: ")){
                        Text("₸\(totalPerYear)")
                    }
                    
                    
            }
            .navigationBarTitle("Финансовый калькулятор")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

