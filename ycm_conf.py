import subprocess

def Settings( **kwargs ):
    client_data = kwargs[ 'client_data' ]
    return {
        'interpreter_path': subprocess.check_output(
            'pipenv --py || which python',
            shell=True).strip()
    }

