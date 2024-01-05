#include<iostream>
#include<string>
#include<vector>
using namespace std;
int main(){

    int measure, len=0, note_len=0;
    string comm;
    vector<string> res;
    cout<<"delete to kill latest key"<<endl;
    cout<<"which measure?"<<endl;
    cin>>measure;
    cout<<"enter the note value."<<endl;
    while(cin>>comm){
        
        if(comm == "delete"){
            if(res.empty()) cout<<"no key to delete."<<endl;
            else {
                for(int i=0; i<note_len; i++) res.pop_back();
                cout<<"delete a key"<<endl;
            }
        }
        else{
            note_len = stoi(comm);
            cout<<"enter the note"<<endl;
            cin>>comm;
            for(int i=0; i<note_len-1; i++) 
                res.push_back("14'd"+ to_string((measure-1)*64+len++) + " : toneL = " + comm + ";");
            res.push_back("14'd"+ to_string((measure-1)*64+len++) + " : toneL = " + "1" + ";");
        }
        if(res.size() == 64) {
            cout<<"/*measure "<<measure<<" */"<<endl;
            for(int i=0; i<64; i++){
                if(i%4 == 3) cout<<res[i]<<endl;
                else cout<<res[i]<<" ";
            }
            len = 0;
            while(!res.empty()) res.pop_back();
            cout<<"which measure?"<<endl;
            cin>>measure;
        }
        else if(res.size()>64) {
            cout<<"measure length too long"<<endl;
            len = 0;
            while(!res.empty()) res.pop_back();
            cout<<"which measure?"<<endl;
            cin>>measure;
        }
        cout<<"enter the note value."<<endl;
    }

}