class process_derivative:
    def __init__(self,expression='',terms=[]):
        self.__expression = expression
        self.__terms = terms
    def setExpression(self,expression):
       self.__expression = expression.replace('-','+-')
    def getTerms(self):
       self.__terms = self.__expression.split("+")
    def getDerivative(self):
        newList = []
        for i in self.__terms:
            if i=="":
                self.__terms.remove("")
            if i.isdigit() == True:
                pass
            elif i.find("^") == -1:
                if len(i) == 1:
                        newList.append("1")
                if len(i) == 2:
                        newList.append("-1")
                if len(i) >2:
                    a = i[:-2]
                    newList.append(a)
            else:
                everything = i.split("^")
                base = everything[0]
                variable = base[-1]
                power = everything[1]
                if len(base) == 1:
                        scalar = "1"
                if len(base) == 2:
                        scalar = "-1"
                if len(base) >2:
                    scalar = base[:-2]
                newS = str(float(scalar)*int(power))
                nPower = str(int(power)-1)
                if newS == "1":
                    if nPower == "1":
                        i = variable
                    else:
                        i = variable+"^"+nPower
                else:
                    if nPower == "1":
                        i = newS+"*"+variable
                    else:
                        i = newS+"*"+variable+"^"+nPower
                newList.append(i)
        if newList == []:
            derivative = "0"
        else:
            derivative = '+'.join(newList)
            derivative = derivative.replace('+-','-')
        return derivative
    def get_first_derivative(self):
        Ls=0
        for i in ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]:
            location=self.__expression.find(i)
            if location==-1:
                Ls +=location
        if Ls==-51:
            self.setExpression(self.__expression)
            self.getTerms()
            returnSt="The first derivative is: "+self.getDerivative()+"."
            return returnSt
        elif Ls==-52:
            returnSt="The first derivative is: 0."
            return returnSt
        else:
            return "invalid input"

