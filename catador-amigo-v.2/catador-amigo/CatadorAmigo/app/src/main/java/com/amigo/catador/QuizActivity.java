package com.amigo.catador;

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.amigo.catador.R;

public class QuizActivity extends Fragment {

    public static int quantity_answers_correct;
    View v;
    Context mContext;
    @Nullable
    @Override
    public View  onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        mContext = getActivity();
        v = inflater.inflate(R.layout.activity_quiz, container,false);


        FrameLayout resulButton = v.findViewById(R.id.display_result_bt);

        final RadioGroup radiogroup1 =  v.findViewById(R.id.group1);
        final RadioGroup radiogroup2 =  v.findViewById(R.id.group2);
        final RadioGroup radiogroup3 =  v.findViewById(R.id.group3);
        final RadioGroup radiogroup4 =  v.findViewById(R.id.group4);
        final RadioGroup radiogroup5 =  v.findViewById(R.id.group5);
        final RadioGroup radiogroup6 =  v.findViewById(R.id.group6);
        final RadioGroup radiogroup7 =  v.findViewById(R.id.group7);
        final RadioGroup radiogroup8 =  v.findViewById(R.id.group8);
        final RadioGroup radiogroup9 =  v.findViewById(R.id.group9);
        final RadioGroup radiogroup10 =  v.findViewById(R.id.group10);
        final RadioGroup radiogroup11 =  v.findViewById(R.id.group11);
        final RadioGroup radiogroup12 =  v.findViewById(R.id.group12);
        final RadioGroup radiogroup13 =  v.findViewById(R.id.group13);
        final RadioGroup radiogroup14 =  v.findViewById(R.id.group14);
        final RadioGroup radiogroup15 =  v.findViewById(R.id.group15);



        resulButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vs) {
                quantity_answers_correct = 0;
                try {
                    int selectedId1 = radiogroup1.getCheckedRadioButtonId();
                    RadioButton radioButton1 = v.findViewById(selectedId1);

                    int selectedId2 = radiogroup2.getCheckedRadioButtonId();
                    RadioButton radioButton2 = v.findViewById(selectedId2);

                    int selectedId3 = radiogroup3.getCheckedRadioButtonId();
                    RadioButton radioButton3 = v.findViewById(selectedId3);

                    int selectedId4 = radiogroup4.getCheckedRadioButtonId();
                    RadioButton radioButton4 = v.findViewById(selectedId4);

                    int selectedId5 = radiogroup5.getCheckedRadioButtonId();
                    RadioButton radioButton5 = v.findViewById(selectedId5);

                    int selectedId6 = radiogroup6.getCheckedRadioButtonId();
                    RadioButton radioButton6 = v.findViewById(selectedId6);

                    int selectedId7 = radiogroup7.getCheckedRadioButtonId();
                    RadioButton radioButton7 = v.findViewById(selectedId7);

                    int selectedId8 = radiogroup8.getCheckedRadioButtonId();
                    RadioButton radioButton8 = v.findViewById(selectedId8);

                    int selectedId9 = radiogroup9.getCheckedRadioButtonId();
                    RadioButton radioButton9 = v.findViewById(selectedId9);

                    int selectedId10 = radiogroup10.getCheckedRadioButtonId();
                    RadioButton radioButton10 = v.findViewById(selectedId10);

                    int selectedId11 = radiogroup11.getCheckedRadioButtonId();
                    RadioButton radioButton11 = v.findViewById(selectedId11);

                    int selectedId12 = radiogroup12.getCheckedRadioButtonId();
                    RadioButton radioButton12 = v.findViewById(selectedId12);

                    int selectedId13 = radiogroup13.getCheckedRadioButtonId();
                    RadioButton radioButton13 = v.findViewById(selectedId13);

                    int selectedId14 = radiogroup14.getCheckedRadioButtonId();
                    RadioButton radioButton14 = v.findViewById(selectedId14);

                    int selectedId15 = radiogroup15.getCheckedRadioButtonId();
                    RadioButton radioButton15 = v.findViewById(selectedId15);

                    if (radioButton1.getText().equals(getString(R.string.q1_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton1.getText().equals(getString(R.string.q1_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton1.getText().equals(getString(R.string.q1_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton1.getText().equals(getString(R.string.q1_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton2.getText().equals(getString(R.string.q2_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton2.getText().equals(getString(R.string.q2_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton2.getText().equals(getString(R.string.q2_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton2.getText().equals(getString(R.string.q2_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton3.getText().equals(getString(R.string.q3_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton3.getText().equals(getString(R.string.q3_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton3.getText().equals(getString(R.string.q3_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton3.getText().equals(getString(R.string.q3_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton4.getText().equals(getString(R.string.q4_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton4.getText().equals(getString(R.string.q4_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton4.getText().equals(getString(R.string.q4_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton4.getText().equals(getString(R.string.q4_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton5.getText().equals(getString(R.string.q5_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton5.getText().equals(getString(R.string.q5_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton5.getText().equals(getString(R.string.q5_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton5.getText().equals(getString(R.string.q5_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton6.getText().equals(getString(R.string.q6_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton6.getText().equals(getString(R.string.q6_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton6.getText().equals(getString(R.string.q6_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton6.getText().equals(getString(R.string.q6_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton7.getText().equals(getString(R.string.q7_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton7.getText().equals(getString(R.string.q7_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton7.getText().equals(getString(R.string.q7_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton7.getText().equals(getString(R.string.q7_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton8.getText().equals(getString(R.string.q8_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton8.getText().equals(getString(R.string.q8_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton8.getText().equals(getString(R.string.q8_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton8.getText().equals(getString(R.string.q8_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton9.getText().equals(getString(R.string.q9_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton9.getText().equals(getString(R.string.q9_2))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton10.getText().equals(getString(R.string.q10_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton10.getText().equals(getString(R.string.q10_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton10.getText().equals(getString(R.string.q10_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton10.getText().equals(getString(R.string.q10_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton11.getText().equals(getString(R.string.q11_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton11.getText().equals(getString(R.string.q11_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton11.getText().equals(getString(R.string.q11_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton11.getText().equals(getString(R.string.q11_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton12.getText().equals(getString(R.string.q12_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton12.getText().equals(getString(R.string.q12_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton12.getText().equals(getString(R.string.q12_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton12.getText().equals(getString(R.string.q12_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton13.getText().equals(getString(R.string.q13_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton13.getText().equals(getString(R.string.q13_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton13.getText().equals(getString(R.string.q13_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton13.getText().equals(getString(R.string.q13_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton14.getText().equals(getString(R.string.q14_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton14.getText().equals(getString(R.string.q14_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton14.getText().equals(getString(R.string.q14_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton14.getText().equals(getString(R.string.q14_4))) {
                        quantity_answers_correct += 1;
                    }

                    if (radioButton15.getText().equals(getString(R.string.q15_1))) {
                        quantity_answers_correct += 4;
                    } else if (radioButton15.getText().equals(getString(R.string.q15_2))) {
                        quantity_answers_correct += 3;
                    } else if (radioButton15.getText().equals(getString(R.string.q15_3))) {
                        quantity_answers_correct += 2;
                    } else if (radioButton15.getText().equals(getString(R.string.q15_4))) {
                        quantity_answers_correct += 1;
                    }

                    FragmentManager fm = ((FragmentActivity) mContext)
                            .getSupportFragmentManager();

                    //show dialog fragment
                    DisplayResultFragment displayResultFragment = new DisplayResultFragment();
                    displayResultFragment.show(fm, "display_result");
                }catch (Exception ex){
                    Toast.makeText(getActivity(),"Responda o Questionário!", Toast.LENGTH_SHORT).show();
                }


            }
        });

        AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
        alertDialog.setTitle("Seja Bem-vindo(a)");
        alertDialog.setMessage("Responda 15 questões que têm como objetivo identificar alguns dos hábitos que compõem seu estilo de vida. A partir deles, poderemos estimar a quantidade de recursos naturais necessária para sustentar suas atividades diárias.\n" +
                "Responda ao questionário e conheça o tamanho estimado de sua pegada ecológica!\n" +
                "Pode ser uma surpresa!");
        alertDialog.setNegativeButton("OK!", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });
        alertDialog.show();

        return v;
    }


}
