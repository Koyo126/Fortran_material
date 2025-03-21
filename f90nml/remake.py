import f90nml
import warnings

with warnings.catch_warnings():
    warnings.simplefilter('error')
    try:
        # ネームリストファイルを読み込む
        nml = f90nml.read('./Input.nml')

        # 変数を変更する
        #nml['ave']['nfile'] = 1
        nml['ave']['nfile'] *= 2  ### double nfile
        nml['ave']['avetype'] = 0
        nml['ave']['var'] = [x * 2 for x in nml['ave']['var']]
        nml['initial']['start'] = True
        nml['scf']['zImagePlane'] = [-15.0, 15.0]  ### array

        # 変更したネームリストをファイルに書き込む
        nml.write('./RewrittenInput.nml', force=True)

    except Exception as e:
        print(f"エラーまたは警告が発生しました: {e}")
        exit(1)
