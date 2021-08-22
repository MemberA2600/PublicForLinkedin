using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Generate_Plants : MonoBehaviour
{



    // Start is called before the first frame update
    void Start()
    {
        int countBack = 2300;
        GameObject preFab;

        while (countBack > 0)
        {
            int type = Random.Range(1,3);
            int x = Random.Range(0, 400);
            int y = Random.Range(0, 400);
            switch (type)
            {
                case 1:
                    preFab = (GameObject)Resources.Load("Bush");
                    GameObject one = Instantiate(preFab, new Vector3(transform.position.x+x, transform.position.y, transform.position.z + y), Quaternion.identity);
                    one.GetComponent<Rigidbody>().transform.Rotate(0,Random.Range(0,360),0,Space.Self);
                    break;
                case 2:
                    preFab = (GameObject)Resources.Load("Grass1");
                    GameObject two =  Instantiate(preFab, new Vector3(transform.position.x + x, transform.position.y, transform.position.z + y), Quaternion.identity);
                    two.GetComponent<Rigidbody>().transform.Rotate(0, Random.Range(0, 360), 0, Space.Self);

                    break;
                case 3:
                    preFab = (GameObject)Resources.Load("Grass2");
                    GameObject three = Instantiate(preFab, new Vector3(transform.position.x + x, transform.position.y, transform.position.z + y), Quaternion.identity);
                    three.GetComponent<Rigidbody>().transform.Rotate(0, Random.Range(0, 360), 0, Space.Self);

                    break;
            }
            countBack--;
        }

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
