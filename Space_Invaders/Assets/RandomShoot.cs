using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomShoot : MonoBehaviour
{

    public int shootNumber;

    // Start is called before the first frame update
    void Start()
    {
        shootNumber = 0;
        StartCoroutine(Generate_Shoot());

    }

    // Update is called once per frame
    void Update()
    {

    }

    IEnumerator Generate_Shoot()
    {
        while (true)
        {

            List<GameObject> enemies = gameObject.GetComponent<Manage_Enemies>().enemies;
            if (enemies.Count > 0 && shootNumber<5)
            {
                int num = Random.Range(0, enemies.Count - 1);
                GameObject prefab = (GameObject)Resources.Load("EnemyShoot");
                Instantiate(prefab, new Vector3(enemies[num].transform.position.x, enemies[num].transform.position.y, 0), Quaternion.identity);
                shootNumber++;
            }

            yield return new WaitForSeconds(1);
        }
    }
}
