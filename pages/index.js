import { initializeDatabase } from '../database/db.js'
import Layout from '../components/Layout.js';

const Index = props => {
    return (
        <Layout>
            <ul>
                {(props.cars.length > 0) ? props.cars.map(car => (
                <li key={car.id}>
                    <p>Brand: {car.brand} {car.subrand}</p>
                    <p>Type: {car.type}</p>
                    <p>Horse Power: {car.hp}</p>
                </li>
                )): <p>There are no any car in our database... :(</p>}
            </ul>
        </Layout>
    )
};

Index.getInitialProps = async () => {
    const firebase = await initializeDatabase();
    const db = firebase.firestore();
    const snapshot = db.collection('cars').get();
 
    let result = (await snapshot).docs.map(d => d.data());
    console.log(result);
    return {
        cars: result
    };
}

export default Index;