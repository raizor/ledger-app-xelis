from ragger.backend.interface import BackendInterface
from ragger.bip import calculate_public_key_and_chaincode, CurveChoice

from application_client.boilerplate_command_sender import BoilerplateCommandSender
from application_client.boilerplate_response_unpacker import unpack_get_app_and_version_response
from application_client.boilerplate_response_unpacker import unpack_get_public_key_response
from .utils import verify_version, verify_name

# In this test we check that the GET_PUBLIC_KEY works in non-confirmation mode
def test_get_public_key_no_confirm(backend: BackendInterface) -> None:
    path_list = [
        "m/44'/1'/0'/0/0"
        #"m/44'/1'/0/0/0",
        #"m/44'/1'/911'/0/0",
        #"m/44'/1'/255/255/255",
        #"m/44'/1'/2147483647/0/0/0/0/0/0/0"
    ]
    for path in path_list:
        client = BoilerplateCommandSender(backend)
        response = client.get_public_key(path=path).data
        _, public_key, _, chain_code = unpack_get_public_key_response(response)

        ref_public_key, ref_chain_code = calculate_public_key_and_chaincode(CurveChoice.Secp256k1, path=path)
        assert public_key.hex() == ref_public_key
        assert chain_code.hex() == ref_chain_code

        print(f"Public Key  : {version}")
        print(f"Private Key : {app_name}")
