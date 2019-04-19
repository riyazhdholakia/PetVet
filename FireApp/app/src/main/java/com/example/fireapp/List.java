package com.example.fireapp;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


public class List extends MainActivity {
    private Button button;
    private Button button2;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list);
        button=(Button)findViewById(R.id.button2);
        button.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Intent i = new Intent(List.this,Address.class);
                List.this.startActivity(i);
            }
        });

        button2=(Button)findViewById(R.id.petbutton);
        button2.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Intent i1 = new Intent(List.this,Login.class);
                List.this.startActivity(i1);
            }
        });
    }
}
