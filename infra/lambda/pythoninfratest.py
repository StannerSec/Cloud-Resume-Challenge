import unittest
from unittest.mock import Mock, patch
from lambda_function import lambda_handler  # Assuming your Lambda function is in a file named lambda_function.py

class TestLambdaFunction(unittest.TestCase):
    @patch('boto3.resource')
    @patch('boto3.Table')
    def test_lambda_handler(self, mock_dynamodb_resource, mock_dynamodb_table):
        # Mock DynamoDB resource and table
        mock_resource_instance = Mock()
        mock_table_instance = Mock()
        mock_dynamodb_resource.return_value = mock_resource_instance
        mock_dynamodb_table.return_value = mock_table_instance

        # Mock DynamoDB get_item response
        mock_get_item_response = {
            'Item': {'id': '0', 'Views': 5}
        }

        # Mock DynamoDB put_item response
        mock_put_item_response = {}

        # Patch DynamoDB Table methods
        mock_table_instance.get_item.return_value = mock_get_item_response
        mock_table_instance.put_item.return_value = mock_put_item_response

        # Call the Lambda function
        result = lambda_handler({}, {})

        # Assert that the expected calls were made
        mock_resource_instance.Table.assert_called_once_with('MyTable')
        mock_table_instance.get_item.assert_called_once_with(Key={'id': '0'})
        mock_table_instance.put_item.assert_called_once_with(Item={'id': '0', 'Views': 6})

        # Assert the result
        self.assertEqual(result, 6)

if __name__ == '__main__':
    unittest.main()
