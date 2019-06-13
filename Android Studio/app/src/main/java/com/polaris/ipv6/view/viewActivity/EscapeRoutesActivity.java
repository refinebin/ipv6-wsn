package com.polaris.ipv6.view.viewActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.annotation.Nullable;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import com.polaris.ipv6.R;
import com.polaris.ipv6.presenter.EscapeRoutesPresenter;
import com.polaris.ipv6.util.DatabaseHelper;
import com.polaris.ipv6.view.EscapeRoutesView;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;

import butterknife.BindView;
import butterknife.ButterKnife;

public class EscapeRoutesActivity extends AppCompatActivity implements EscapeRoutesView{
    @BindView(R.id.select_image_btn)
    Button selectImaBtn;
    @BindView(R.id.escape_routes_image)
    ImageView imageView;
    @BindView(R.id.up_image_btn)
    Button upImaBtn;
    EscapeRoutesPresenter escapeRoutesPresenter;
    private Uri imageUri;
    public static final int TAKE_PHOTO = 1;
    public static final int CROP_PHOTO = 2;
    public static final int CUT_PHOTO = 3;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_escape__routes_);
        ButterKnife.bind(this);
        final DatabaseHelper dbHelper = new DatabaseHelper(this,"Fire.db",null,2);
        final SQLiteDatabase db = dbHelper.getWritableDatabase();
        escapeRoutesPresenter = new EscapeRoutesPresenter(this);
        Log.d("what is the db value: ",db+"");
        String im = getImaView(db);
        if (im!=null){
            imageUri = Uri.parse(im);
        }
        imageView.setImageURI(imageUri);
        selectImaBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder=new AlertDialog.Builder(EscapeRoutesActivity.this);
                builder.setTitle("上传图片");//设置对话框的标题
                builder.setMessage("选择方式");//设置对话框的内容
                builder.setPositiveButton("摄像头", new DialogInterface.OnClickListener() {  //这个是设置确定按钮
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
//                      创建File对象，用于存储拍照后的图片
                        File outputImage = new File(Environment.getExternalStorageDirectory(), new Date().getTime()+"tempImage.jpg");
                        try {
                            if (outputImage.exists()) {
                                outputImage.delete();
                            }
                            outputImage.createNewFile();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        imageUri = Uri.fromFile(outputImage);
                        Intent intent=new Intent("android.media.action.IMAGE_CAPTURE");
                        intent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri);
                        startActivityForResult(intent, TAKE_PHOTO);
//                      启动相机程序
                    }
                });
                builder.setNegativeButton("从相册中选择", new DialogInterface.OnClickListener() {  //这个是设置确定按钮
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        File outputImage = new File(Environment. getExternalStorageDirectory(), new Date().getTime()+"output_image.jpg");
                        try {
                            if (outputImage.exists()) {
                                outputImage.delete();
                            }
                            outputImage.createNewFile();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        imageUri = Uri.fromFile(outputImage);
                        Intent intent = new Intent(Intent.ACTION_PICK,null);
                        intent.setDataAndType(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, "image/*");
                        intent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri);
                        startActivityForResult(intent, CUT_PHOTO);
                    }
                });
                AlertDialog b=builder.create();
                b.show();  //必须show一下才能看到对话框，跟Toast一样的道理
            }
        });
        upImaBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                setImaView(db,imageUri.toString());
                Toast.makeText(EscapeRoutesActivity.this,"上传成功",Toast.LENGTH_SHORT).show();

            }
        });

    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case TAKE_PHOTO:
                if (resultCode == RESULT_OK) {
                    Intent intent=new Intent("com.android.camera.action.CROP");
                    intent.setDataAndType(imageUri, "image/*");
                    intent.putExtra("scale", true);
                    intent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri);
                    startActivityForResult(intent, CROP_PHOTO); // 启动裁剪程序
                }break;
            case CUT_PHOTO:
                if (resultCode == RESULT_OK) {
                    Intent intent=new Intent("com.android.camera.action.CROP");
                    intent.setDataAndType(data.getData(), "image/*");
                    intent.putExtra("scale", true);
                    intent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri);
                    startActivityForResult(intent, CROP_PHOTO); // 启动裁剪程序
                }break;
            case CROP_PHOTO:
                if (resultCode == RESULT_OK) {
                    try {
                        Bitmap bitmap = BitmapFactory.decodeStream (getContentResolver() .openInputStream(imageUri));
                        imageView.setImageBitmap(bitmap); // 将裁剪后的照片显示出来
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                    }
                } break;
            default: break;
        }
    }

    @Override
    public String getImaView(SQLiteDatabase db) {
        String im = escapeRoutesPresenter.getImaUrl(db);
        return im;
    }

    @Override
    public void setImaView(SQLiteDatabase db, String imaUrl) {
        if(imageUri==null){
            escapeRoutesPresenter.setImaUrl(db, "");
        }else{
            escapeRoutesPresenter.setImaUrl(db, imaUrl);
        }

    }
}
